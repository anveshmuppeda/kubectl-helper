# This is for testing commands  

k patch deploy deploy -p '{"spec":{"template":{"spec":{"containers":{"resources":{"requests":{"cpu":"50"}}}}}}}'  

k patch deploy deploy -p '
{"spec":
    {"template":
        {"spec":
            {"containers":
                {"resources":
                    {"requests":
                        {"cpu":"50m"}
                    }
                }
            }
        }
    }
}'  

kubectl patch deploy deploy -p '{"spec":{"template":{"spec":{"containers":[{"name":"nginx-deploy","resources":{"requests":{"cpu":"50m"}}}]}}}}'
 
kubectl patch deploy deploy -p '
{"spec":
    {"template":
        {"spec":
            {"containers":
                [{"name":"your-container-name",
                    "resources":
                        {"requests":
                            {"cpu":"50m"}
                        }
                }]
            }
        }
    }
}'


kubectl patch pod/deploy-6c4486c547-gc9jw -p '{"spec":{"containers":[{"name":"nginx-deploy","resources":{"requests":{"cpu":"75m"}}}]}}'