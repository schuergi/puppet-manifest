# site.pp for Semtix
# defines two types of nodes: our clients and our server
# TODO split client class to reflect different rooms
#node 'cece.semtix', 'lucy.semtix' {
#	include semtix::client
#	include printer::judith
#	include printer::virtual
#	}

node 'helene.semtix', 'ullah.semtix', 'clara.semtix', 'cece.semtix', 'lucy.semtix' {
	include semtix::client
#	include printer::judith
	include printer::ppd
	include printer::virtual
	include semtix::distcc
	}

#node gretel.semtix {
#
#	include semtix::server
#}

#node helene.semtix {
#	
#        include semtix::client
#       include printer::judith
#       include printer::virtual
#        include semtix::firmware
#}
