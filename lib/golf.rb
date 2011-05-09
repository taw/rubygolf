class Golf
  class <<self
    def hole1 a
      a.inject :*
    end
    def hole2 a
      a.split.sort_by{|x|x[1]}*" "
    end
    def hole3 n
      hole1 1..n
    end
    def hole4 n
      n.map{|u|
        u.gsub("cat","dead").gsub(/man.*/,'hat(\0)').gsub /dog(.*)\)/,'dog\1(bone))'
      }
    end
    def hole5 a
      z=a.size
      u=[]
      (0...z).map{|i|
        u+=(i...z).map{|j|
          (i..j).map{|k|a[k]}
        }
      }
      u.sort_by{|x|[x.size,x]}
    end
    def hole6 n
      (1..n).map{|n|
        r = ["fizz"][n%3]
        r = "#{r}buzz" if n%5 == 0
        r || n
      }
    end
    def hole7 r
      o=[]
      while a=b=r.shift
        b=r.shift while r[0]==b+1
        o<<"#{a}#{a<b ?-b:''}"
      end
      o
    end
    def hole8 n
      r=[1,1]
      (n-2).times{r<<r[-1]+r[-2]}
      r
    end
    def hole9 f
      v=File.readlines(f).map{|x|x.scan /\w+/}
      loop{
        c=v.flatten.uniq
        e=0
        r=c.map{|a|
          e+=t=v.count{|j,|j==a}
          [t,a]
        }.sort
        n,q=r[-1]
        break q if 2*n>=e
        v.map{|w|w.delete r[0][1]}
      }
    end
  end
end
