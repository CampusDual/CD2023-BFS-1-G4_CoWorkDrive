import { OTranslateService } from "ontimize-web-ngx";

export class D3LocaleOptions {


    constructor(protected translate: OTranslateService) {
    }

    getD3Options(): Object {
        let lang = this.translate.getCurrentLang() ? this.translate.getCurrentLang().toLowerCase() : '';
        switch (lang) {
            case 'es':
                return this.es_ES_D3_Locale;
            case 'en':
                return this.en_US_D3_Locale;
            case 'ru':
                return this.ru_RU_D3_Locale;
            case 'de':
                return this.de_DE_D3_Locale;
            case 'fr':
                return this.fr_FR_D3_Locale;
            case 'pt':
                return this.pt_PT_D3_Locale;
            default:
                return this.en_US_D3_Locale;
        }
    }

    protected readonly es_ES_D3_Locale = {
        decimal: ",",
        thousands: ".",
        grouping: [3],
        currency: ["", " €"],
        dateTime: "%A, %e de %B de %Y, %X",
        date: "%d/%m/%Y",
        time: "%H:%M:%S",
        periods: ["AM", "PM"],
        days: ["domingo", "lunes", "martes", "miércoles", "jueves", "viernes", "sábado"],
        shortDays: ["dom", "lun", "mar", "mié", "jue", "vie", "sáb"],
        months: ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"],
        shortMonths: ["ene", "feb", "mar", "abr", "may", "jun", "jul", "ago", "sep", "oct", "nov", "dic"]
    }

    protected readonly en_GB_D3_Locale = {
        decimal: ".",
        thousands: ",",
        grouping: [3],
        currency: ["£", ""],
        dateTime: "%a %e %b %X %Y",
        date: "%d/%m/%Y",
        time: "%H:%M:%S",
        periods: ["AM", "PM"],
        days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
        shortDays: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
        months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
        shortMonths: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    };

    protected readonly en_US_D3_Locale = {
        decimal: ".",
        thousands: ",",
        grouping: [3],
        currency: ["$", ""],
        dateTime: "%a %b %e %X %Y",
        date: "%m/%d/%Y",
        time: "%H:%M:%S",
        periods: ["AM", "PM"],
        days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
        shortDays: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
        months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
        shortMonths: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    };

    protected readonly ru_RU_D3_Locale = {
        decimal: ",",
        thousands: "\xa0",
        grouping: [3],
        currency: ["", " руб."],
        dateTime: "%A, %e %B %Y г. %X",
        date: "%d.%m.%Y",
        time: "%H:%M:%S",
        periods: ["AM", "PM"],
        days: ["воскресенье", "понедельник", "вторник", "среда", "четверг", "пятница", "суббота"],
        shortDays: ["вс", "пн", "вт", "ср", "чт", "пт", "сб"],
        months: ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"],
        shortMonths: ["янв", "фев", "мар", "апр", "май", "июн", "июл", "авг", "сен", "окт", "ноя", "дек"]
    }

    protected readonly de_DE_D3_Locale = {
        decimal: ",",
        thousands: ".",
        grouping: [3],
        currency: ["", " €"],
        dateTime: "%A, der %e. %B %Y, %X",
        date: "%d.%m.%Y",
        time: "%H:%M:%S",
        periods: ["AM", "PM"], // unused
        days: ["Sonntag", "Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"],
        shortDays: ["So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"],
        months: ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"],
        shortMonths: ["Jan", "Feb", "Mrz", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Dez"]
    };

    protected readonly fr_FR_D3_Locale = {
        decimal: ",",
        thousands: ".",
        grouping: [3],
        currency: ["", " €"],
        dateTime: "%A, le %e %B %Y, %X",
        date: "%d/%m/%Y",
        time: "%H:%M:%S",
        periods: ["AM", "PM"], // unused
        days: ["dimanche", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"],
        shortDays: ["dim.", "lun.", "mar.", "mer.", "jeu.", "ven.", "sam."],
        months: ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"],
        shortMonths: ["janv.", "févr.", "mars", "avr.", "mai", "juin", "juil.", "août", "sept.", "oct.", "nov.", "déc."]
    }

    protected readonly pt_PT_D3_Locale = {
        decimal: ",",
        thousands: ".",
        grouping: [3],
        currency: ["", " €"],
        dateTime: "%A, le %e %B %Y, %X",
        date: "%d/%m/%Y",
        time: "%H:%M:%S",
        periods: ["AM", "PM"], // unused
        days: ["dimanche", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"],
        shortDays: ["dim.", "lun.", "mar.", "mer.", "jeu.", "ven.", "sam."],
        months: ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"],
        shortMonths: ["janv.", "févr.", "mars", "avr.", "mai", "juin", "juil.", "août", "sept.", "oct.", "nov.", "déc."]
    }
}