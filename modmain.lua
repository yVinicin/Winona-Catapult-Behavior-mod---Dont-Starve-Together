local GLOBAL = GLOBAL
local TUNING = GLOBAL.TUNING
local TheSim = GLOBAL.TheSim


local RETARGET_MUST_TAGS = { "monster", "_combat" }
local RETARGET_CANT_TAGS = { "INLIMBO", "player", "engineering", "eyeturret", "companion", "wall", "structure", "notarget" }

local function AlwaysAggressiveRetarget(inst)
    local target = inst.components.combat.target

    if target and not inst:IsTargetTooFar(target) and not inst:IsTargetTooClose(target) then
        return
    end

    local x, y, z = inst.Transform:GetWorldPosition()
    
    local ents = TheSim:FindEntities(x, y, z, TUNING.WINONA_CATAPULT_MAX_RANGE + 3, { "_combat" }, RETARGET_CANT_TAGS)

    local playertargets = {}
    for _, player in ipairs(GLOBAL.AllPlayers) do
        if player.components.combat and player.components.combat.target ~= nil then
            -- Salva o alvo do jogador na nossa lista
            playertargets[player.components.combat.target] = true
        end
    end

    local tooclosetarget = nil
    for _, v in ipairs(ents) do
        if v ~= inst and
           v ~= target and
           v.entity:IsVisible() and
           not inst:IsTargetTooFar(v) and
           inst.components.combat:CanTarget(v) then

            local is_naturally_hostile = v:HasTag("monster") or v:HasTag("hostile")
            
            local current_target = v.components.combat.target
            local is_attacking_us = current_target and (current_target:HasTag("player") or current_target == inst)

            local i_am_attacking_it = playertargets[v] == true

            if is_naturally_hostile or is_attacking_us or i_am_attacking_it then
                if not inst:IsTargetTooClose(v) then
                    return v, true
                elseif tooclosetarget == nil then
                    tooclosetarget = v
                end
            end
        end
    end

    return tooclosetarget, true
end

AddPrefabPostInit("winona_catapult", function(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return
    end

    local _SetActiveMode = inst.SetActiveMode
    inst.SetActiveMode = function(self, active)
        
        if not active and self._powertask ~= nil then
            if self.components.timer then
                self.components.timer:StartTimer("active_time", 10)
            end
            return
        end

        _SetActiveMode(self, active)

        if active and self.components.combat then
            self.components.combat:SetRetargetFunction(1, AlwaysAggressiveRetarget)
        end
    end

    local _AddBatteryPower = inst.AddBatteryPower
    inst.AddBatteryPower = function(self, power)
        _AddBatteryPower(self, power)
        
        if self._powertask ~= nil and not self:IsActiveMode() then
            self:SetActiveMode(true)
        end
    end
end)
