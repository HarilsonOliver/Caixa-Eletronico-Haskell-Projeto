import System.Exit

deposito valor cont =  cont + valor

saque valor cont =  abs(cont - valor)
 
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
        do putStrLn "Saldo em Conta é de: "; contents <- readFile conta; putStrLn ("R$ " ++ show contents); putStrLn " ";
      else if op == 2
      then 
        do {putStrLn "Informe o valor do Depósito: ";
        numero <- getLine;
        contentC <- readFile conta;
        writeFile auxiliar (show (deposito (read contentC::Double) (read numero::Double)));
        content2 <- readFile auxiliar;
        writeFile conta content2;
        putStrLn "Depósito Efetuado!";
        putStrLn " " }
      else if op == 3
      then 
        do {putStrLn "Informe o valor do Saque: ";
        numero <- getLine;
        contentC <- readFile conta;
        if (read contentC::Double) < (read numero::Double) then do putStrLn "Valor do saque excede valor em Conta.";putStrLn "Saldo em Conta é de: "; contents <- readFile conta; putStrLn ("R$ " ++ show contents); putStrLn " ";
        else do {writeFile auxiliar (show (saque (read contentC::Double) (read numero::Double))); putStrLn "Saque Efetuado!"; putStrLn " " };
        content2 <- readFile auxiliar;
        writeFile conta content2;}
      else if op == 4 
      then 
        do putStrLn "Agradecemos por usar o Banco Haskell S.A.!!" ; putStrLn " ";exitSuccess ;
  else putStrLn "Opção inválida...Escolha Novamente"; putStrLn " ";

main;



