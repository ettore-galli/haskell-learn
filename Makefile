WHAT=experiments/PutJSON.hs

compile:
	ghc -Wall ${WHAT}

json:
	@$(eval JPATH=experiments/cap5)
	@$(eval ODIR=experiments/cap5/build)
	ghc -c -odir ${ODIR} ${JPATH}/SimpleJSON.hs ${JPATH}/PutJSON.hs ${JPATH}/PrettyJSON.hs 
	ghc -odir ${ODIR} -o ${ODIR}/simple ${JPATH}/Main.hs ${JPATH}/SimpleJSON.hs ${JPATH}/PutJSON.hs