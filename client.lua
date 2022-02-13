
local playerHealthBloodOn = 199 

local playerHealthBloodOff = 199

local particleDictionary = "core"

local particleName = "blood_stab"

local TimeBlood = 5000


local Blood = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local playerHealth = GetEntityHealth(player)

        if playerHealth < playerHealthBloodOn then
            Blood = true
            Wait(TimeBlood)
            Blood = false
            Wait(TimeBlood)
        end

        if playerHealth > playerHealthBloodOff then
            Blood = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local ped = PlayerPedId()
        if Blood then


            RequestNamedPtfxAsset(particleDictionary)

            while not HasNamedPtfxAssetLoaded(particleDictionary) do
                Citizen.Wait(0)
            end
            
            bone = GetPedBoneIndex(ped, 18905)

            SetPtfxAssetNextCall(particleDictionary)
            Blood1 =  StartNetworkedParticleFxNonLoopedOnPedBone(particleName, ped, 0.05, -0.0000, 0.0000, 0.0, 180.0, 0.0, 57005, 0.2, false, false, false)
            SetPtfxAssetNextCall(particleDictionary)
            Blood2 = StartNetworkedParticleFxNonLoopedOnPedBone(particleName, ped, 0.15, -0.0000, 0.0000, 0.0, 180.0, 0.0, 18905, 0.2, false, false, false)
        end
    end
end)
