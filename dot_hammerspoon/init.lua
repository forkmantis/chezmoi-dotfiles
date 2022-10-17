hs.loadSpoon("ManageLayouts")
spoon.ManageLayouts:bindHotkeys(
    {
        info={{"cmd", "alt", "ctrl"}, "I"}
    }
)
spoon.ManageLayouts:start()

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
    local win = hs.window.focusedWindow()
    local information = win:application():name() .. ": " .. win:title() .. " in screen " .. "(" .. win:screen():id() .. ") " .. win:screen():name()
    hs.pasteboard.setContents(information)
    hs.notify.new({title="App/Screen Information", informativeText=information}):send()
end)

hs.hotkey.bind({"cmd", "alt"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - f.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - f.w
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + f.w
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + f.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
	local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
	local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()
	local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x 
    f.y = max.y
    f.w = max.w
    f.h = max.h
    
    win:setFrame(f)
end)

function reloadConfig(files)
    doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end 
    if doReload then
        hs.reload()
    end
end

myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.notify.new({title="Hammerspoon", informativeText="Hammerspoon config reloaded"}):send()
