# by b3rksecurity
# dont change rights u mad
# greats to prosox & terO & kt4na & sezyo cuz is my hbibou
dos2unix $0 2>/dev/null 1>/dev/null
i=$(($i+1))
for i in $(seq 1 500);
do
        icobenchgrab=$(curl -i -s -k -L --url "https://icobench.com/icos?page=${i}" | grep -Po 'href="/ico/(.*?)"' | cut -d / -f3 | cut -d '"' -f1 | sed -e 's/^/https\:\/\/icobench.com\/ico\//' | sort | uniq >> icotrack)
done
echo ${icobenchgrab}
if [[ ${icobenchgrab} != "" ]]
then
        echo "No ICO on this page"
else
        split -l 5 icotrack lareussite
        for ico in $(cat lareussite*);do
                curl -s -k -i -L --url ${ico} | grep -Po "href='(.*?)'" | cut -d / -f3 | cut -d "'" -f1 >> icos.txt
        done
fi
