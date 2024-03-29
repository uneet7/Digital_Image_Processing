function [ ID ] = myOlympic( inImg, wSize )
%%img reading
I = imread(inImg);
[m,n,c] = size(I);

%%%%defiining the padding size 
pad_size = floor(wSize/2);
I_padded = zeros(m+2*pad_size , n+2*pad_size , c); %%%making a new extra arge paded matrix with zeros as padded values
I_padded(pad_size+1:pad_size+m,pad_size+1:pad_size+n,1:end) = I(1:end,1:end,1:end);

ID = I;

%applying the formula on all three colors 
for z=1:c
    for i=pad_size+1:pad_size+m
        for j=pad_size+1:pad_size+n
            sum=0.0; min = -10000; max = 10000;
            for k=i-pad_size:i+pad_size
                for l=j-pad_size:j+pad_size
                        sum = sum + I_padded(k,l,z);
                        if(I_padded(k,l,z)<min)
                            min = I_padded(k,l,z);
                        end

                        if(I_padded(k,l,z) > max)
                            max = I_padded(k,l,z);
                        end
                end
            end
            sum = sum - min - max;
            ID(i,j,z) = sum/(wSize^2-2);
        end
    end
end
%imshow(ID);
end

