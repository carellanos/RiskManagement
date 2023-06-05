using { riskmanagement as rm } from '../db/schema';

 @path: 'service/risk'
 service RiskService {
 //entity Risks as projection on rm.Risks; // Se comenta para no eliminar del todo 
 //Se agrega las proximas lineas de codigo
 entity Risks @(restrict : [
       {
          grant : [ 'READ' ],
          to : [ 'RiskViewer' ]
       },
       {
           grant : [ '*' ],
           to : [ 'RiskManager' ]
       }
   ]) as projection on rm.Risks;//Hasta aqui se agrega este codigo
     annotate Risks with @odata.draft.enabled;
 //entity Mitigations as projection on rm.Mitigations;  // Se comenta para no eliminar del todo
 // Se agrega el siguiente codigo 
 entity Mitigations @(restrict : [
       {
         grant : [ 'READ' ],
         to : [ 'RiskViewer' ]
       },
       {
         grant : [ '*' ],
         to : [ 'RiskManager' ]
       }
   ]) as projection on rm.Mitigations;//hasta aqui se agrega
     annotate Mitigations with @odata.draft.enabled;
  @readonly entity BusinessPartners as projection on rm.BusinessPartners;
 }