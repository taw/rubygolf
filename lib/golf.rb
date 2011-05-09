class Golf
  class <<self
    def hole1 a
      a.inject(&:*)
    end
    def hole2 a
      a.split.sort_by{|x|x[1]}.join " "
    end
    def hole3 n
      (1..n).inject(&:*)
    end
    def hole4 n
      n.map{|u|
        u.gsub("cat","dead").gsub(/man(.*)/,'hat(man\1)').gsub /dog(.*)\)/,'dog\1(bone))'
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
        r = ""
        r << "fizz" if n%3 == 0
        r << "buzz" if n%5 == 0
        r == "" ? n : r
      }
    end
    def hole7 r
      o=[]
      while a=b=r.shift
        b=r.shift while r[0]==b+1
        o<<"#{a}#{a==b ?'':-b}"
      end
      o
    end
    def hole8 n
      r=[0,1]
      n.times{r<<r[-1]+r[-2]}
      r[1..-2]
    end
    def hole9 f
      v=File.readlines(f).map{|x|x.scan /\w+/}
      while c=v.flatten.uniq
        e=0
        r=c.map{|a|
          t=v.count{|j,|j==a}
          e+=t
          [t,a]
        }.sort
        n,q=r[-1]
        break q if 2*n>=e
        v.map{|w|w.delete r[0][1]}
      end
    end
  end
end
