import System.Exit

deposito valor cont =  cont + valor

saque valor cont =  abs(valor - cont)
 
main :: IO ()
main = do 
 
let conta = "conta.txt";
let auxiliar = "auxiliar.txt";
  
putStrLn"==============================";
putStrLn"       Banco Haskell S.A.";
putStrLn"==============================";
putStrLn "Opções:";
putStrLn "1. Saldo";
putStrLn "2. Depósito";
putStrLn "3. Saque";
putStrLn "4. Fim";
putStrLn "Escolha uma opção:";
op <- readLn;

  if op == 1
      then 
        do putStrLn "Saldo em Conta: "; contents <- readFile conta; putStrLn ("R$ " ++ show contents);
      else if op == 2
      then 
        do {putStrLn "Informe o valor do Depósito: ";
        numero <- getLine;
        contentC <- readFile conta;
        writeFile auxiliar (show (deposito (read contentC::Int) (read numero::Int)));
        content2 <- readFile auxiliar;
        writeFile conta content2;
        putStrLn " Deposito Feito" }
      else if op == 3
      then 
        do {putStrLn "Informe o valor do Saque: ";
        numero <- getLine;
        contentC <- readFile conta;
        writeFile auxiliar (show (saque (read contentC::Int) (read numero::Int)));
        content2 <- readFile auxiliar;
        writeFile conta content2;
        putStrLn " Saque Feito" }
      else if op == 4 
      then 
        do putStrLn "Agradecemos por usar o JojoBank" ; exitSuccess ;
  else putStrLn "Opção inválida...";

main;



