b52MP = {};
b52MP.path = g_currentModDirectory;
b52MP.firstLoad = true;
if b52MP.path:sub(-1) ~= '/' then
    b52MP.path = b52MP.path .. '/';
end;
b52MP.modName = g_currentModName;

-- XML
source(b52MP.path .. 'scripts/MP/b52MPMultiplayerMessage.lua');

function b52MP:loadMap(name)
  print("-- B52 MP Loaded");
end;

function b52MP:deleteMap(name)
end;

function b52MP:keyEvent(unicode, sym, modifier, isDown)
end;

function b52MP:mouseEvent(posX, posY, isDown, isUp, button)
end;

function b52MP:update(dt)
  if b52MP.firstLoad then
    if self.showControlsInHelpScreen then
      --g_currentMission:addHelpButtonText(g_i18n:getText("input_PRICE_NOTIFY_SHOW_MENU"), InputBinding.PRICE_NOTIFY_SHOW_MENU, nil, GS_PRIO_VERY_LOW)
      g_currentMission:addHelpButtonText(g_i18n:getText("input_B52_MP_SEND_MESSAGE"), InputBinding.B52_MP_SEND_MESSAGE, nil, GS_PRIO_VERY_LOW)
    end;
    b52MP.firstLoad = false;
  end;

  -- Open the menu
  if InputBinding.hasEvent(InputBinding.B52_MP_SEND_MESSAGE) then
      if g_currentMission.getIsClient() then
        b52MPMultiplayerMessage.sendEvent("This is a test message!");
      end;
  end
end;

function b52MP:draw()
end;

addModEventListener(b52MP);
