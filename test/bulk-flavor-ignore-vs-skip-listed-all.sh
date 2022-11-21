FLAVOR_DEFAULT_ALL=no
FLAVOR_ALL=all

LISTPORTS="misc/foo-FLAVORS-unsorted@${FLAVOR_ALL}"
OVERLAYS="overlay omnibus"
. common.bulk.sh

do_bulk -n ${LISTPORTS}
assert 0 $? "Bulk should pass"

# With misc/foo-FLAVORS-unsorted@all nothing should be skipped.
# Everything should just be ignored.
EXPECTED_IGNORED="misc/foo-FLAVORS-unsorted@IGNORED misc/foo-FLAVORS-unsorted@DEPIGNORED misc/foo-dep-FLAVORS-unsorted@DEPIGNORED"
EXPECTED_SKIPPED=
EXPECTED_QUEUED="misc/foo-FLAVORS-unsorted misc/foo-FLAVORS-unsorted@FLAV misc/foo-dep-FLAVORS-unsorted misc/foo-dep-FLAVORS-unsorted@FLAV ports-mgmt/pkg"
EXPECTED_LISTED="misc/foo-FLAVORS-unsorted misc/foo-FLAVORS-unsorted@DEPIGNORED misc/foo-FLAVORS-unsorted@FLAV misc/foo-FLAVORS-unsorted@IGNORED"

assert_bulk_queue_and_stats