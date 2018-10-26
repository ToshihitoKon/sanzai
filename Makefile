osc2018tokyo_fall: OSC2018Tokyo_Fall.html OSC2018Tokyo_Fall.csv csvparse.awk
	sed -i '/SANZAI_LIST_BEGIN/,/SANZAI_LIST_END/{/^[#|<]/!d}' OSC2018Tokyo_Fall.html
	cat OSC2018Tokyo_Fall.csv  | sed 's/\//\\\//g' | tac | awk -f csvparse.awk | tr ';' "'" | sed "s/$$/OSC2018Tokyo_Fall.html/" | sh
	sed -i -E 's/([0-9])([0-9]{3})$$/\1,\2/g' OSC2018Tokyo_Fall.html
	sed -i '/##/ a \\' OSC2018Tokyo_Fall.html
	sed -i '/##/ i \\' OSC2018Tokyo_Fall.html

ossumit2018: OSSummit2018.html OSSummit2018.csv csvparse.awk
	sed -i '/SANZAI_LIST_BEGIN/,/SANZAI_LIST_END/{/^[#|<]/!d}' OSSummit2018.html
	cat OSSummit2018.csv  | sed 's/\//\\\//g' | tac | awk -f csvparse.awk | tr ';' "'" | sed "s/$$/OSSummit2018.html/" | sh
	sed -i -E 's/([0-9])([0-9]{3})$$/\1,\2/g' OSSummit2018.html
	sed -i '/##/ a \\' OSSummit2018.html
	sed -i '/##/ i \\' OSSummit2018.html
