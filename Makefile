ossumit2018: OSSummit2018.html OSSummit2018.csv csvparse.awk
	sed -i '/SANZAI_LIST_BEGIN/,/SANZAI_LIST_END/{/^[#|<]/!d}' OSSummit2018.html
	cat OSSummit2018.csv  | sed 's/\//\\\//g' | tac | awk -f csvparse.awk | tr ';' "'" | sed "s/$$/OSSummit2018.html/" | sh
	sed -i '/##/ a \\' OSSummit2018.html
	sed -i '/##/ i \\' OSSummit2018.html
