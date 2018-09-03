tableextension 123456700 "CSD Resource Type" extends Resource
{
    fields
    {
        field(123456701; "CSD Resource Type"; Option)
        {
            OptionMembers = "Internal", "External";
            Caption = 'Resource Type';
            OptionCaption = 'Internal,External';

        }
        field(123456702; "CSD Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(123456703; "CSD Quantity Per Day"; Decimal)
        {
            Caption = 'Quantity Per Day';
        }
        modify("Profit %")

        {
            trigger OnBeforeValidate();

            begin
                rec.testfield("Unit Cost");
            end;
        }
    }
}