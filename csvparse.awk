BEGIN{
    FS=","
    OFS=""
}
{
    print "sed -i ;/## ",$1,"/ a ",$2,": ",$3,"; "
}
