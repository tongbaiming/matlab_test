clc;
clear;
rosshutdown;
rosinit;
sub = rossubscriber('/ddddfff','tbmplanner/point_msg');


pub = rospublisher('/ddddfff', 'tbmplanner/point_msg');
msg = rosmessage(pub);
msg.Point=[1,2,3,4,5,6];
msg.PointSize=6;
pause(1);
send(pub,msg);
msg2=receive(sub,10);
msg2
msg3 = rosmessage('tbmplanner/gain_full_srvRequest');
showdetails(msg3)
msg3.Points=[msg, msg];
showdetails(msg3.Points(1))
showdetails(msg3.Points(2))
msg4(1) = rosmessage('tbmplanner/point_msg');
for i=1:4
    msg4(i) = rosmessage('tbmplanner/point_msg');
    msg4(i).Point = [3 4 5 6 7 8];
    msg4(i).PointSize = 6;
end
msg5 = rosmessage('tbmplanner/gain_full_srvRequest')
msg5.Points = msg4;
msg5.Points
showdetails(msg5.Points(2))

server = rossvcserver('/matlab_solver', 'tbmplanner/matlabsolver_srv', @matlabsolverSrvCallback);
svcClient = rossvcclient('/matlab_solver');
svcReq = rosmessage(svcClient);
showdetails(svcReq);
svcResp = call(svcClient,svcReq,'Timeout', 3);
svcResp

