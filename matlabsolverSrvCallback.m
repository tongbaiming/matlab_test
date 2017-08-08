function response = matlabsolverSrvCallback(sever, reqmsg, defaultrespmsg, matlabOdomeClient)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
response = defaultrespmsg;
matlabOdomeMsg = receive(matlabOdomeClient, 10);
quaternion = [matlabOdomeMsg.Pose.Pose.Orientation.X, matlabOdomeMsg.Pose.Pose.Orientation.Y, ...
    matlabOdomeMsg.Pose.Pose.Orientation.Z,matlabOdomeMsg.Pose.Pose.Orientation.W];
[roll,pitch,yaw]=quat2angle(quaternion, 'XYZ');
position = [matlabOdomeMsg.Pose.Pose.Position.X, matlabOdomeMsg.Pose.Pose.Position.Y,matlabOdomeMsg.Pose.Pose.Position.Z];
x0 = [position, roll, pitch, yaw];

%response.IsSolve = 1;
%disp('xxxffff')
end

