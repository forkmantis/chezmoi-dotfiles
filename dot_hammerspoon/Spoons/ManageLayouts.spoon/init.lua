local obj={}
obj.__index = obj

-- Metadata
obj.name = "ManageLayouts"
obj.version = "0.1"
obj.author = "Will Killian <github.user@forkmantis.com>"
obj.homepage = ""
obj.license = "MIT - https://opensource.org/licenses/MIT"

-- local variables
local screenWatcher = nil
local laptopScreen = "Color LCD"
local screenOne = nil
local screenTwo = nil

local twoMonitorTeeLayout = {
    {"Google Chrome", nil, screenOne, hs.layout.left50, nil, nil},
    {"iTerm2", nil, screenOne, hs.layout.right50, nil, nil}
}

local oneMonitorLayout = {
    {"Google Chrome", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"iTerm2", nil, laptopScreen, hs.layout.maximized, nil, nil}
}

function obj:bindHotkeys(mapping)
   local def = {
     info = hs.fnutils.partial(self.getInfo, self),
   }
   hs.spoons.bindHotkeysToSpec(def, mapping)
end

function obj:getInfo() 
    local screens = hs.screen.allScreens()
    local screenCount = #screens
    hs.notify.new({title="App/Screen Information", informativeText=screenCount}):send()
end

local function onScreensChanged()
    local screens = hs.screen.allScreens()
    local screenCount = #screens

    screenOne = nil
    screenTwo = nil

    if screenCount == 1 then
        hs.layout.apply(oneMonitorLayout)
    elseif screenCount == 2 then
        screenOne = hs.screen.mainScreen():toNorth()
        hs.layout.apply(twoMonitorTeeLayout)
    end
end

function obj:start()
    --[[
    screenWatcher = hs.screen.watcher.new(onScreensChanged)
    screenWatcher:start()
    print("ManageLayouts.spoon Started")
    ]]
end

function obj:stop()
    if not screenWatcher then
        screenWatcher:stop()
        screenWatcher = nil
    end
end

return obj
