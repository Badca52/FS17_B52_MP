b52MPMultiplayerMessage = {};
b52MPMultiplayerMessage_mt = Class(b52MPMultiplayerMessage, Event);
InitEventClass(b52MPMultiplayerMessage, "b52MPMultiplayerMessage");

function b52MPMultiplayerMessage:emptyNew()
  local self = Event:new(b52MPMultiplayerMessage_mt);
  self.className = "b52MPMultiplayerMessage";
  return self;
end;

function b52MPMultiplayerMessage:new(msg)
  local self = b52MPMultiplayerMessage:emptyNew();
  self.message = msg;
  return self;
end;

function b52MPMultiplayerMessage:writeStream(streamId, connection)
  streamWriteString(streamId, self.message);
end;

function b52MPMultiplayerMessage:readStream(streamId, connection)
  self.message = streamReadString(streamId);
  self:run(connection);
end;

function b52MPMultiplayerMessage.sendEvent(msg)
  if g_currentMission:getIsServer() then
    -- nothing
  else
      g_client:getServerConnection():sendEvent(b52MPMultiplayerMessage:new(msg));
  end;
end;

function b52MPMultiplayerMessage:run(connection)
  if g_currentMission:getIsServer() then
    print(self.message);
  end;
  --print(g_currentMission.getIsServer());
  --print(g_currentMission.getIsClient());
  --print(g_dedicatedServerInfo ~= nil);
end;
