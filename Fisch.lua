 -- Variables
local player = game.Players.LocalPlayer
local fishingRod = player.Backpack:FindFirstChild("FishingRod") -- Ensure the player has a fishing rod in their backpack
local castButton = game.StarterGui.ScreenGui.CastButton -- Assuming there's a button in the UI to cast the line
local fishBiteTime = math.random(5, 10) -- Random time for fish to bite (in seconds)
local isFishing = false

-- Function to cast the line
function castLine()
    if isFishing == false and fishingRod then
        isFishing = true
        print("Casting line...")
        -- Animation or visual effect for casting line here
        
        -- Wait for the fish to bite
        wait(fishBiteTime)
        print("Fish is biting!")
        
        -- Show catch button or use input to catch the fish
        catchFish()
    end
end

-- Function to catch the fish
function catchFish()
    print("Catching fish...")
    -- Animation or visual effect for catching fish here
    
    -- Check if fish is successfully caught (e.g., with a random chance)
    local success = math.random(1, 10) > 3 -- 70% chance to catch fish
    if success then
        print("Fish caught!")
        -- Give fish to player (add to inventory or points system)
        local fish = Instance.new("Part") -- Example of adding a fish object
        fish.Name = "Fish"
        fish.Parent = player.Backpack
    else
        print("Fish got away!")
    end
    
    isFishing = false
end

-- Connect the cast button to the casting function
castButton.MouseButton1Click:Connect(castLine)