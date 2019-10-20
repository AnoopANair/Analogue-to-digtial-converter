% Author: Anoop A Nair
% coded in matlab simulink
% coded on 19/10/19






% clear the workspace
clear all
% record audio using the audio recorder object
recObj = audiorecorder;
disp('start recording.');
recordblocking(recObj, 5);
disp('End of Recording.');
% play the recording for confirmation
play(recObj);
% store the audio clip in an array
y = getaudiodata(recObj);
% plot the wave for visualization
plot(y,'g');
hold on;

% length of the array y
L=length(y);
disp("length");
disp(L)
% mean of the array y values so as to get the symmetric crossing
u=mean(y);
disp("mean")
disp(u);
%plot the crossing in red
z=u*ones(1,L);
plot(z,'r');
hold on;

% fnd the absolute maximum of the array values

absol=abs(y);
mx=max(absol);
disp("max");
disp(mx);
% plot the two extreme limits
amx=mx*ones(1,L);
amx1=(-1)*mx*ones(2,L);
plot(amx);
hold on;
plot(amx1);
hold on;

% enter the level of required quantization
QN=input("enter level of qunatization");
disp("quantization");
disp(QN);
% obtain the quantization value
quanta = (mx-u)/QN;
disp("quantum");
disp(quanta);
% predefine an array
Lw = zeros(1,QN);
disp(Lw);
limit= QN+1;
% plotting the quantized leves in blue
for i = 1:QN
        Lw(i)=(i)*quanta;
        lines= Lw(i)*ones(1,L);
        plot(lines,'b');
        hold on;
        lines1= (-1)*Lw(i)*ones(1,L);
        plot(lines1,'b');
        hold on;
       
end
disp(Lw);
% predefine array for storing the quantized wave value
f=ones(1,L);
% wave quantization algoritm

for j = 1:L
%     j
%     y(j)
    if y(j)==0
         f(j)=0;
        %disp(f(j))
    elseif y(j)==mx
        f(j)=mx;
       % disp(f(j))
    elseif y(j)>0
        for k = 1:QN
            if y(j)< Lw(k)
                f(j)= (Lw(k)-quanta);
                break
                %disp(f(j))
            end
        end
    elseif y(j)<0
        for k = 1:QN
            if abs(y(j))< Lw(k)
                f(j)= (-1)*(Lw(k)-quanta);
                break
               % disp(f(j))
            end
        end
    end
   
end
% length of f
h=length(f);
disp(h);
% plot the quantized wave
plot(f,'k')
% play quantized wave
sound(f)
