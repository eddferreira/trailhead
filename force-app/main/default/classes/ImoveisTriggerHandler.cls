public class ImoveisTriggerHandler{
    // Metodo para inclusão de um novo imovel
    public static void updateImoveis(List<Imoveis__c> imv){
        List<Casa__c> casas = new List<Casa__c>(); 
        List<Apartamento__c> aptos = new List<Apartamento__c>();

        for (Imoveis__c imvAtual: imv){
            if(imvAtual.TipImovel__c == 'Casa'){
                Casa__c casa = new Casa__c();
                casa.Quant_Quartos__c = imvAtual.Quartos__c;
                casa.Valor_Imovel__c = imvAtual.Valor__c;
                casa.imvId__c = imvAtual.imvId__c;
                casas.add(casa);
            }else if(imvAtual.TipImovel__c == 'Apartamento'){
                Apartamento__c ap = new Apartamento__c();
                ap.Quant_Quartos_apt__c = imvAtual.Quartos__c;
                ap.Valor__c = imvAtual.Valor__c;
                ap.imvId__c = imvAtual.imvId__c;
                aptos.add(ap);
            }
        }
        
        if(!casas.isEmpty()) insert casas; 
        if(!aptos.isEmpty()) insert aptos;   
    }

    // Metodo para exclusão de um novo imovel, com casa e apartamento
    public static void deleteImv(List<Imoveis__c> imvOld){
        List<Casa__c> delCasa = new List<Casa__c>();
        List<Apartamento__c> delApto = new List<Apartamento__c>();

        for(Imoveis__c delImv : imvOld){
            delCasa.addAll(getCasa(delImv.imvId__c));
            delApto.addAll(getApto(delImv.imvId__c));
        }

        if(!delCasa.isEmpty()) delete delCasa;
        if(!delApto.isEmpty()) delete delApto;
    }

    // Metodo para buscar dados da casa
    public static List<Casa__c> getCasa(String imvcasa){
        List<Casa__c> newCasa = [Select imvId__c from Casa__c where imvId__c =: imvcasa];

        return newCasa;
    }

    //Metodo para buscar dados do apartamento 
    public static List<Apartamento__c> getApto(String imvApto){
        List<Apartamento__c> newApto = [Select imvId__c from Apartamento__c where imvId__c =: imvApto];   

        return newApto;
    }
}