#
# Make my life easier : autogenerating code from whois -t output
#
for OBJECT in $( find lib/Net/Whois/Object/ | cut -d/ -f 5 | cut -d. -f 1 | sort -u )
do
perl helper-scripts/whois_to_attribute.pl $OBJECT >> lib/Net/Whois/Object/$OBJECT.pm
done
