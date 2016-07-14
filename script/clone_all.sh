

REPOS=(infra books_service customer_service order_service books_service_client customer_service_client online_store order_service_client)

echo "${REPOS[@]}"
for REPO in "${REPOS[@]}"
do
      echo "cloning ${REPO}" >> echo
      git clone "git@github.com:MyBookStore/${REPO}.git"
continue
done
