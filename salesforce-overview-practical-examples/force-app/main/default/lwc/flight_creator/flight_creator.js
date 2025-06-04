import { LightningElement, api, wire } from 'lwc';
import addNewFlightRelation from '@salesforce/apex/FlightController.addNewFlight';

export default class Flight_creator extends LightningElement {

    cardTitle = 'Add a New Flight';
    tooShortMessageInputValidation = 'IATA contains 3 digits';
    alternativeSpinnerText = 'Creating...';
    codeExample = 'ex. BCN';
    showInformationSection = false;
    actionHasErrors = true;
    arrivalInputIATA;
    departureInputIATA;

    sameArrivanAndDepartureErrorMessage = 'You cannot enter the same airports for Arrival & Departure.';

    actionResult;
    departureName;
    arrivalName;
    totalDistance;

    showSpinner = false;

    // having labels in variables allows us to apply translations later
    labelDepartureName = 'Departure Airport Name: ';
    labelArrivalName = 'Arrival Airport Name: ';
    labelTotalDistance = 'Total Distance: ';
    labelActionResult = 'Action result: ';
    labelInputDeparture = 'Departure Airport';
    labelInputArrival = 'Arrival Airport';
    labelSubmitButton = 'Submit';
    labelOkButton = 'OK';

    helpTextContent = 'IATA is a 3-digit code unique to each airport.';

    validateIATAInputs() {
        console.log('clicked submit!');
        const arrivalInputNoErrors = this.template.querySelector(".arrivalInput").reportValidity(); // true if no errors
        const departureInputNoErrors = this.template.querySelector(".departureInput").reportValidity();
        console.log('errors: ' + arrivalInputNoErrors + ' ' + departureInputNoErrors);
        if (arrivalInputNoErrors && departureInputNoErrors) {
            this.arrivalInputIATA = this.template.querySelector(".arrivalInput").value;
            this.departureInputIATA = this.template.querySelector(".departureInput").value;

            if (this.arrivalInputIATA !== this.departureInputIATA)
                this.addNewFlight();
            else {
                this.showInformationSection = true;
                this.actionHasErrors = true;
                this.actionResult = this.sameArrivanAndDepartureErrorMessage;
            }
        }
    }

    addNewFlight() {
        this.showSpinner = true;
        addNewFlightRelation({ arrivalAirportIATA: this.arrivalInputIATA, departureAirportIATA: this.departureInputIATA })
            .then(data => {
                console.log(data);

                this.actionResult = data.message;

                if (!this.actionResult.includes('Oops')) {
                    this.arrivalName = data.arrivalAirportName;
                    this.departureName = data.departureAirportName;
                    this.totalDistance = parseFloat(data.departureDistance).toFixed(3) + ' KM';
                    this.showInformationSection = true;
                    this.actionHasErrors = false;
                }
                else {
                    this.showInformationSection = true;
                    this.actionHasErrors = true;
                }
                this.showSpinner = false;

            })
            .catch(error => {
                console.error(error);
            });

    }

    returnToInitialView() {
        this.showInformationSection = false;
        this.actionHasErrors = false;
    }
}