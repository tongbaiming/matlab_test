yaw = 1;
pitch = 1;
roll = 1;
roll_ref = 1.2;
pitch_ref = 1.2;
velocity = [2;3;4];
position = [1;2;3];
g = [0;0;9.8066];
R = [cos(yaw)*cos(pitch)  cos(yaw)*sin(pitch)*sin(roll)-cos(roll)*sin(yaw)  (cos(yaw)*sin(pitch)*cos(roll)+sin(yaw)*sin(roll)); ...
    cos(pitch)*sin(yaw)  cos(yaw)*cos(roll)+sin(yaw)*sin(pitch)*sin(roll)  (sin(yaw)*sin(pitch)*cos(roll)-cos(yaw)*sin(roll)); ...
    -sin(pitch)                            cos(pitch)*sin(roll)                            cos(pitch)*cos(roll)];

z_B = R(:,3);
linear_drag_coefficient= [0.01, 0.01, 0];
thrust = 10;
%nonlinear drag model
drag_acc = thrust*[linear_drag_coefficient(1) 0 0; 0 linear_drag_coefficient(2) 0; 0 0 0]*R'*velocity;

roll_tau=0.257;
roll_gain=0.75;
pitch_tau=0.259;
pitch_gain=0.78;

droll = (1/roll_tau)*(roll_gain*roll_ref - roll);
dpitch = (1/pitch_tau)*(pitch_gain*pitch_ref - pitch);

f = dot([velocity; roll; pitch; yaw; position]) == ...
    [z_B*thrust-g-drag_acc+external_forces;...
    droll; ...
    dpitch;...
    0;...
    velocity;...
    ];
