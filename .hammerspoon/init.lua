-- GRID
hs.window.animationDuration=0.1
local hotkey = require "hs.hotkey"
local grid = require "hs.grid"

grid.MARGINX = 0
grid.MARGINY = 0
grid.GRIDHEIGHT = 4
grid.GRIDWIDTH = 6

local hyper  = {"alt", "cmd"}
local mod_move = {"ctrl", "alt"}

-- Move Window
hotkey.bind(mod_move, 'j', grid.pushWindowDown)
hotkey.bind(mod_move, 'k', grid.pushWindowUp)
hotkey.bind(mod_move, 'h', grid.pushWindowLeft)
hotkey.bind(mod_move, 'l', grid.pushWindowRight)

-- Resize Window
hotkey.bind(hyper, 'k', grid.resizeWindowShorter)
hotkey.bind(hyper, 'j', grid.resizeWindowTaller)
hotkey.bind(hyper, 'l', grid.resizeWindowWider)
hotkey.bind(hyper, 'h', grid.resizeWindowThinner)

-- Resize Window Fixed
local resizeFull = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f, 0)
end

local resizeLeft = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f, 0)
end

local resizeRight = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f, 0)
end

local resizeTop = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f, 0)
end

local resizeBottom = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.y = max.y + (max.h/2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f, 0)
end

local mash = { "alt" }

hs.hotkey.bind(mash, "h", resizeLeft)
hs.hotkey.bind(mash, "j", resizeBottom)
hs.hotkey.bind(mash, "k", resizeTop)
hs.hotkey.bind(mash, "l",  resizeRight)
hs.hotkey.bind(mash, ";", resizeFull)
