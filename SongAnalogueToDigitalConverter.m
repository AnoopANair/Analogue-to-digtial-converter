
%clear all
clear all
% read audio file

start = input("enter the start");
end=input("enter the end");
file= input("wav filename")
b= audioread(file,[start,end]);

%size of audio read
disp(size(b))

% reducing the dimensions
r=length(b);
y=[];
for p = 1:r
    y(p)= b(p,2);
end
% play the song
sound(y,44100)
% dimension of y
disp(size(y))

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
hold on
% play quantized wave
sound(f,44100)


% second quantization

% enter the level of required quantization
QN1=input("enter level of qunatization");
disp("quantization");
disp(QN1);
% obtain the quantization value
quanta1 = (mx-u)/QN1;
disp("quantum");
disp(quanta1);
% predefine an array
Lw1 = zeros(1,QN1);
disp(Lw1);
limit1= QN1+1;
% plotting the quantized leves in blue
for i = 1:QN1
        Lw1(i)=(i)*quanta1;
        l1ines= Lw1(i)*ones(1,L);
        plot(l1ines,'b');
        hold on;
        l1ines1= (-1)*Lw1(i)*ones(1,L);
        plot(l1ines1,'b');
        hold on;
       
end
disp(Lw1);
% predefine array for storing the quantized wave value
f1=ones(1,L);
% wave quantization algoritm

for j = 1:L
%     j
%     y(j)
    if y(j)==0
         f1(j)=0;
        %disp(f(j))
    elseif y(j)==mx
        f1(j)=mx;
       % disp(f(j))
    elseif y(j)>0
        for k = 1:QN1
            if y(j)< Lw1(k)
                f1(j)= (Lw1(k)-quanta);
                break
                %disp(f(j))
            end
        end
    elseif y(j)<0
        for k = 1:QN1
            if abs(y(j))< Lw1(k)
                f1(j)= (-1)*(Lw1(k)-quanta);
                break
               % disp(f(j))
            end
        end
    end
   
end
% length of f
h1=length(f1);
disp(h1);
% plot the quantized wave
plot(f1,'b')
% play quantized wave
sound(f1,44100)

%save as audio files

Fs=44100 ;
audiowrite('real.wav',y,Fs);audiowrite('real1.wav',f,Fs);audiowrite('real2.wav',f1,Fs);
