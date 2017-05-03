function [ e ] = getCl( Nc, rep,cl,in )
flag = 0;
c=1;

while(c<=Nc)
     a=cl(c,:);
     e=find(a==in);
        if(length(e)==1)
           flag = c;
           break;
        end
     a=[];
c=c+1;
 end
 e=flag;
end

