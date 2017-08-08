function [ output_args ] = matlabOdomeCallback( ~, msg )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
output_args = msg;
quaternion = [msg.Pose.Pose.Orientation.X, msg.Pose.Pose.Orientation.Y,msg.Pose.Pose.Orientation.Z,msg.Pose.Pose.Orientation.W];
[roll,pitch,yaw]=quat2angle(quaternion, 'XYZ');
postion = [msg.Pose.Pose.Position.X,msg.Pose.Pose.Position.Y,msg.Pose.Pose.Position.Z]
output_args = [position, roll, pitch, yaw];
end

