import { LightningElement, track } from 'lwc';
import consulCEP from '@salesforce/apex/ConsultaCEPService.consultaCEP';
import { getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import UserPreferencesNewLightningReportRunPageEnabled from '@salesforce/schema/User.UserPreferencesNewLightningReportRunPageEnabled';

export default class BuscaCep extends LightningElement {
    @track cep='';
    @track end='';

    gravText(event){
        this.cep = event.target.value;
    }

    searchCpf(){
        consulCEP({cep: this.cep}).then(result=>{
            if(result != null){
                var endereco = `Endereço: ${result.logradouro}                                                                                                                                                                                                                                                                    
                                          ${','}
                                          ${result.bairro}
                                          ${','}
                                          ${result.localidade}
                                          ${','}
                                          ${result.uf} 
                                          ${'-'}
                                          ${result.cep}`;
                console.log(result);
                this.end = endereco;
        
            }    
        }).catch(error=>{
            console.log(error)
        });
    }
}