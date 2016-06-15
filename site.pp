# site.pp for Semtix
# defines two types of nodes: our clients and our server
# TODO split client class to reflect different rooms
node 'cece.semtix', 'hannah.semtix', 'clara.semtix', 'lucy.semtix', 'helene.semtix' {
	include semtix::client
}

node gretel.semtix {

	include semtix::server
}
