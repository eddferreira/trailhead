public class ValTotalTriggerHandler{
    //Atualiza o campo valor total vendido do objeto produto
    public static void ValTot(List<Transacao__c> listValTransacao){
        List<Product2> prod = new List<Product2>();
        Integer index = 0;

       for(Transacao__c ValTransacao : listValTransacao){
            if(ValTransacao.Data_pag__c != null){
                prod.addall(retValProduto(ValTransacao.Valor__c, ValTransacao.Prod_ven__c, index));
            }

            index++;
        }

        update prod;
    }

    // Busca o valor total do produtoc
    public static List<Product2> retValProduto(Decimal Val, id idprod, Integer index){
        List<Product2> novoProduto = [select id, Val_tot__c from Product2 where id =: idprod];
    
        if (novoProduto.get(index).Val_tot__c != null){
            novoProduto.get(index).Val_tot__c += Val;
        }else {
            novoProduto.get(index).Val_tot__c = Val;
        }
   
        return novoProduto;
    }
}