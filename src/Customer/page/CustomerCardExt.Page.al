pageextension 50101 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        modify(General)
        {
            Caption = 'Општо';
        }
        modify("Name")
        {
            Caption = 'Име';
        }
        modify("No.")
        {
            Caption = 'Бр.';
        }
        modify("Credit Limit (LCY)")
        {
            Caption = 'Кредитен лимит (LCY)';
        }
        modify("Blocked")
        {
            Caption = 'Блокиран';
        }
        modify("TotalSales2")
        {
            Caption = 'Вкупна продажба - Фискална година';
        }
        modify("CustSalesLCY - CustProfit - AdjmtCostLCY")
        {
            Caption = 'Трошоци (LCY)';
        }
        modify("Balance (LCY)")
        {
            Caption = 'Салдо (LCY)';
        }
        modify(BalanceAsVendor)
        {
            Caption = 'Салдо (LCY) Како продавач';
        }
        modify("Balance Due (LCY)")
        {
            Caption = 'Преостанато салдо';
        }
        modify("Address & Contact")
        {
            Caption = 'Адреса и контакт';
        }
        modify(Address)
        {
            Caption = 'Адреса';
        }
        modify("Address 2")
        {
            Caption = 'Адреса 2';
        }
        modify("Country/Region Code")
        {
            Caption = 'Код на земја/регион';
        }
        modify("City")
        {
            Caption = 'Град';
        }
        modify(County)
        {
            Caption = 'Округ';
        }
        modify("Post Code")
        {
            Caption = 'Поштенски код';
        }
        modify("Phone No.")
        {
            Caption = 'Телефонски број.';
        }
        modify(MobilePhoneNo)
        {
            Caption = 'Мобилен телефон бр.';
        }
        modify("E-Mail")
        {
            Caption = 'Е-пошта';
        }
        modify("Home Page")
        {
            Caption = 'Почетна страница';
        }
        modify(ContactName)
        {
            Caption = 'Контакт Име';
        }
        modify(Invoicing)
        {
            Caption = 'Фактурирање';
        }
        modify("VAT Registration No.")
        {
            Caption = 'Регистрација за ДДВ бр.';
        }
        modify("EORI Number")
        {
            Caption = 'Број на EORI';
        }
        modify("Use GLN in Electronic Document")
        {
            Caption = 'Користете GLN во електронски документи';
        }
        modify("Copy Sell-to Addr. to Qte From")
        {
            Caption = 'Копирај Продажба на Адреса. до Qte Од';
        }
        modify(PostingDetails)
        {
            Caption = 'Детали за објавување';
        }
        modify(ContactDetails)
        {
            Caption = 'Детали за контактирање';
        }

        modify(AddressDetails)
        {
            Caption = 'Детали за адреса';
        }

        modify("Gen. Bus. Posting Group")
        {
            Caption = 'Генералниот автобус. Група за објавување';
        }

        modify("Customer Posting Group")
        {
            Caption = 'Група за објавување клиенти';
        }
        modify(PricesandDiscounts)
        {
            Caption = 'Цени и попусти';
        }
        modify("Customer Price Group")
        {
            Caption = 'Група за цени на клиенти';
        }
        modify(Payments)
        {
            Caption = 'Плаќања';
        }
        modify("Payment Terms Code")
        {
            Caption = 'Код на услови за плаќање';
        }
        modify(Shipping)
        {
            Caption = 'Испорака';
        }
        modify("Ship-to Code")
        {
            Caption = 'Код од брод до';
        }
        modify("Location Code")
        {
            Caption = 'Код на локација';
        }
        modify("Combine Shipments")
        {
            Caption = 'Комбинирани пратки';
        }
        modify("Reserve")
        {
            Caption = 'Резервирано';
        }
        modify("Shipping Advice")
        {
            Caption = 'Совети за испорака';
        }
        modify("Shipment Method")
        {
            Caption = 'Начин на испорака';
        }
        modify("Shipment Method Code")
        {
            Caption = 'Код';
        }
        modify("Base Calendar Code")
        {
            Caption = 'Основен календарски код';
        }
        modify("Customized Calendar")
        {
            Caption = 'Прилагоден календар';
        }
        modify(Statistics)
        {
            Caption = 'Статистика';
        }
        modify(Balance)
        {
            Caption = 'Биланс';
        }
        modify(TotalMoneyOwed)
        {
            Caption = 'Вкупно должни пари';
        }
        modify(CreditLimit)
        {
            Caption = 'Кредитен лимит';
        }
        modify(CalcCreditLimitLCYExpendedPct)
        {
            Caption = 'Користење на кредитен лимит';
        }
        modify("Sales This Year")
        {
            Caption = 'Продажба оваа година';
        }


        addafter(General)
        {
            group(Master)
            {
                Caption = 'Master Foodio';
                field("MonthlyBudget"; Rec.MonthlyBudget)
                {
                    Caption = 'Monthly Budget';
                    ApplicationArea = All;
                }
            }

        }
    }
}
