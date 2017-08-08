clc;
clear;
rosshutdown;
rosinit;
testclient=rossvcclient('/party_1/instance_1/erlecopter_2/tbmplanner/matlabGainService');
testreq=rosmessage(testclient);
X=[3.0,3.0,1.0,0.1];
gain=getGain(testclient,testreq,X);
%testreq.X=[3.0,3.0,1.0,0.1];
%testresp=call(testclient,testreq,'Timeout', 15);
gain
%sub = rossubscriber('/matlabOdome',@matlabOdomeCallback);
sub2 = rossubscriber('/matlabOdome');
msg2 = receive(sub2,10);
quaternion = [msg2.Pose.Pose.Orientation.X, msg2.Pose.Pose.Orientation.Y,msg2.Pose.Pose.Orientation.Z,msg2.Pose.Pose.Orientation.W];
[roll,pitch,yaw]=quat2angle(quaternion, 'XYZ');
position = [msg2.Pose.Pose.Position.X, msg2.Pose.Pose.Position.Y,msg2.Pose.Pose.Position.Z]
x0 = [position, roll, pitch, yaw];
topicList = rostopic('list');
srvClient=rossvcclient('/party_1/instance_1/erlecopter_2/tbmplanner/matlabGainService');
srvReq=rosmessage(srvClient);
pointsNum=20;
X=zeros(6,pointsNum);
gainFull = getGainFull(srvClient, srvReq, X);
server = rossvcserver('/matlab_solver', 'tbmplanner/matlabsolver_srv', @matlabsolverSrvCallback);