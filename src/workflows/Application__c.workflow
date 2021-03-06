<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>NoModificationNotice</fullName>
        <description>NoModificationNotice</description>
        <protected>false</protected>
        <recipients>
            <field>Candidate_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/NoModificationNotice</template>
    </alerts>
    <alerts>
        <fullName>after_reject</fullName>
        <description>Send_email_after_reject</description>
        <protected>false</protected>
        <recipients>
            <field>Candidate_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/reject_template</template>
    </alerts>
    <alerts>
        <fullName>send_email_after_reject</fullName>
        <description>send_email_after_reject</description>
        <protected>false</protected>
        <recipients>
            <recipient>khangwei@cmu.edu.dev</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Samples/SUPPORT%3A Self-Service Reset Password %28SAMPLE%29</template>
    </alerts>
    <fieldUpdates>
        <fullName>update_email</fullName>
        <field>Candidate_Email_Address__c</field>
        <formula>Candidate__r.Email__c</formula>
        <name>update_email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Send_email_after_reject</fullName>
        <actions>
            <name>after_reject</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2 OR 3 OR 4</booleanFilter>
        <criteriaItems>
            <field>Application__c.Status__c</field>
            <operation>equals</operation>
            <value>Submitted Rejection</value>
        </criteriaItems>
        <criteriaItems>
            <field>Application__c.Status__c</field>
            <operation>equals</operation>
            <value>Recruiter Screen Rejection</value>
        </criteriaItems>
        <criteriaItems>
            <field>Application__c.Status__c</field>
            <operation>equals</operation>
            <value>HM Screen Rejection</value>
        </criteriaItems>
        <criteriaItems>
            <field>Application__c.Status__c</field>
            <operation>equals</operation>
            <value>Rejected</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>update_email</fullName>
        <actions>
            <name>update_email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Candidate_Email_Address__c  = null</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
