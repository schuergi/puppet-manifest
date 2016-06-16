# site.pp for Semtix
# defines two types of nodes: our clients and our server
# TODO split client class to reflect different rooms
node 'cece.semtix', 'lucy.semtix', 'helene.semtix' {
	include semtix::client
	include printer::judith
	}

node 'clara.semtix', 'hannah.semtix' {
	include semtix::client
	include printer::kyocera
	}

node gretel.semtix {

	include semtix::server
}
