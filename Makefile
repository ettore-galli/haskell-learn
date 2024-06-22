WHAT=experiments/PutJSON.hs

compile:
	ghc -Wall ${WHAT}

json:
	@$(eval JPATH=experiments/cap5)
	@$(eval ODIR=experiments/cap5/build)
	ghc -c -odir ${ODIR} ${JPATH}/SimpleJSON.hs ${JPATH}/PutJSON.hs ${JPATH}/PrettyJSON.hs 
	ghc -odir ${ODIR} -o ${ODIR}/simple ${JPATH}/Main.hs ${JPATH}/SimpleJSON.hs ${JPATH}/PutJSON.hs


ex:
	@$(eval JPATH=example)
	@$(eval ODIR=example/build)
	ghc -c -odir ${ODIR} ${JPATH}/HUtils/frame.hs
	ghc -odir ${ODIR} -o ${ODIR}/hello ${JPATH}/Main.hs ${JPATH}/HUtils/frame.hs