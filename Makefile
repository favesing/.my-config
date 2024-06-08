WATCH_FILES= find . -type f -not -path '*/\.*' | grep -i '.*[.]go$$' 2> /dev/null

test:
	go test ${test} ./...

entr_warn:
	@echo "-------------------------------------------------"
	@echo " ! File watching functionality non-operational ! "
	@echo "                                                 "
	@echo " Install entr(1) to run tasks on file change.    "
	@echo " See http://entrproject.org/                     "
	@echo "-------------------------------------------------"

# go test ${test} 允许传递给shell变量带参数。ex: make watch_test test="-i"
watch_test:
	if command -v entr > /dev/null; then \
	${WATCH_FILES} | entr -c $(MAKE) test; \
	else \
	$(MAKE) test entr_warn; \
	fi


