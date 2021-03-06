#!/bin/bash
cleos wallet import --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
cleos wallet import --private-key 5KU4LQuZjdg7K7qKQ7B4gCWSxX4Wn9pnfJ1zSNSDDdTjC5s2eo3
cleos wallet import --private-key 5KdiJygvjhWeU2wPNsgybm4uomy4pbVz8z93hWBmNSjQ9zwrQnU
cleos wallet import --private-key 5J8yEGU9gzaV6WqdaMLyPk89ECK9biheQxP5tf1SKjeuDV7MUKS
cleos wallet import --private-key 5HwMxLDqFwMZ3CmoAEyHz2byM95gj1x5zivmBKDyWrEG8Tj7ZQt
cleos wallet import --private-key 5JTgoiDTZqk5emxGGeXQfyEja6wVZGCZmJqXJq6B4qNFFB29fVD

cleos create account eosio bob EOS6FJrY3d6rx5iP6kQNN1sRRNxJnqfRrNmYL7tgkJrZj1CVrDk6y
cleos create account eosio alice EOS83cWh7iL5SpFLV4etAUQhTtKnYjKtCSeixaAK6TBzBf8vMMAkU
cleos create account eosio john EOS8dKWrRLHx1tULVjVeKJ6TRmRAjgrd51tSzDw3QQbo6FZZuyGKL
cleos create account eosio billy EOS5GDiCs18KTntwp5Uba3Vy5qRgNvH4FBt61YCgfWRUEGJ4hdqT1
cleos create account eosio addressbook EOS5jqNp117CFQVnQ634sgEtffQjGkve7sPw1jG2bn3eDjYWJ12Tk
cleos create account eosio eosio.token EOS5jqNp117CFQVnQ634sgEtffQjGkve7sPw1jG2bn3eDjYWJ12Tk
cleos create account eosio hello EOS5jqNp117CFQVnQ634sgEtffQjGkve7sPw1jG2bn3eDjYWJ12Tk

eosio-cpp contracts/addressbook.cpp -o addressbook.wasm
eosio-cpp contracts/eosio.token.cpp -o eosio.token.wasm
eosio-cpp contracts/hello.cpp -o hello.wasm

cleos set code addressbook addressbook.wasm -p addressbook@active
cleos set abi addressbook addressbook.abi -p addressbook@active

cleos set code eosio.token eosio.token.wasm
cleos set abi eosio.token eosio.token.abi

cleos set code hello hello.wasm
cleos set abi hello hello.abi

cleos set account permission eosio.token active --add-code
cleos set account permission hello active --add-code
cleos set account permission addressbook active --add-code
