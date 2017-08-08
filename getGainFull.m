function gain = getGainFull( srvClient, srvReq,X )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
for i=1:size(X,2)
    pointMsgs(i) = rosmessage('tbmplanner/point_msg');
    pointMsgs(i).Point = X(:,i);
    pointMsgs(i).PointSize = size(X,1);
end
%srvReq = rosmessage('tbmplanner/gain_full_srvRequest');
srvReq.Points = pointMsgs;
srvReq.PointSize = size(X,1);
srvReq.PointsNumber = size(X,2);
srvResp = call(srvClient, srvReq,'Timeout', 10);
gain = srvResp;
end

