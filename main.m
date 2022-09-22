clear all;
clc;
n = input("Please input the value of n (POSITIVE INTEGER):");
N = n + 50;
S = [];

for k = 1:N
    n = k;
    i = 1;
    while n ~= 1
        if mod(n,2) == 0
            n = n/2;
        else
            n = 3 * n + 1;
        end
        i = i + 1;
    end
    S(k)=i;
end

plot(S,'-*');
grid;
xlabel('n');
ylabel('The number of steps');
title('Collatz problems');
%% The Least Squares Method
x = (1:N)';
xf = log(x);
yf = S';
f = inline('a(1)+a(2).*xf','a','xf');
[beta,r] = lsqcurvefit(f,[1,1],xf,yf);
yn = beta(1) + beta(2) * log(x);

subplot(1, 3, 1);
plot(x,S','r-o');
hold on;
plot(x,yn,'b');
grid;

p_1 = yn(1); 
p_2 = yn(2);
%% The L^(1) fit
x = 1:N;
beta = [0;0];
fn = @(x,beta) beta(1) + beta(2) * log(x);
fun = @(beta) sum(abs(S-fn(x,beta)));
a0 = [0,0];
beta = fminsearch(fun,a0);
y = fn(x,beta);

subplot(1,3,2);
plot(x,S,'r-o');
hold on;
plot(x,y,'b');
grid;

p_3 = beta(1); 
p_4 = beta(2);
%% Mixed model
x = 1:N;
beta = [0;0;0;0];
fun_1 = @(n,beta) beta(1) + beta(2) * log(x);
fun_2 = @(n,beta) beta(3) + beta(4) * x;
f = @(beta) sum(min(abs(fun_1(x,beta) - S), abs(fun_2(x,beta) - S))); 
a1 = [1,1,50,-1];
beta = fminsearch(f, a1);

subplot(1,3,3);
plot(x,S,'r-o');
hold on
y_1 = fun_1(x,beta);                         
y_2 = fun_2(x,beta);
plot(x,y_1,'b');
plot(x,y_2,'b');
grid;

p_5 = beta(1); 
p_6 = beta(2);
p_7 = beta(3);
p_8 = beta(4);
%% Output equations
if p_2 > 0
    X = ['The Least Squares Method: ',num2str(p_1),'+',num2str(p_2),'*log(n)'];
    disp(X);
else
    X = ['The Least Squares Method: ',num2str(p_1),'',num2str(p_2),'*log(n)'];
    disp(X);
end

if p_4 > 0
    Y = ['The L^(1) fit: ',num2str(p_3),'+',num2str(p_4),'*log(n)'];
    disp(Y);
else
    Y = ['The L^(1) fit: ',num2str(p_3),'',num2str(p_4),'*log(n)'];
    disp(Y);
end

if p_6 > 0
    if p_8 > 0
        Z = ['Mixed model: ',num2str(p_5),'+',num2str(p_6),'*log(n) and ',num2str(p_7),' + ',num2str(p_8),'*n'];
        disp(Z);
    else 
        Z = ['Mixed model: ',num2str(p_5),'+',num2str(p_6),'*log(n) and ',num2str(p_7),'',num2str(p_8),'*n'];
        disp(Z);
    end
end
if p_6 < 0
    if p_8 > 0
        Z = ['Mixed model: ',num2str(p_5),'',num2str(p_6),'*log(n) and ',num2str(p_7),'+',num2str(p_8),'*n'];
        disp(Z);
    else
        Z = ['Mixed model: ',num2str(p_5),'',num2str(p_6),'*log(n) and ',num2str(p_7),'',num2str(p_8),'*n'];
        disp(Z);
    end
end
