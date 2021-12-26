Class Car {
    [String] $Brand
    [String] $Model
    [int] $DoorsAmount
    [double] $FuelConsumption
    [double] $CurrentFuel

    #Constructor
    Car (
        [String] $Brand,
        [String] $Model,
        [int] $DoorsAmount,
        [double] $FuelConsumption,
        [double] $CurrentFuel
        )
    {
        $this.Brand = $Brand
        $this.Model = $Model
        $this.DoorsAmount = $DoorsAmount
        $this.FuelConsumption = $FuelConsumption
        $this.CurrentFuel = $CurrentFuel
    }

    [String] ToString(){
        return "
        brand = $($this.Brand),
        model = $($this.Model),
        doors amount = $($this.DoorsAmount),
        fuel consumption = $($this.FuelConsumption),
        current fuel = $($this.CurrentFuel)
        "
    }


    [String]KmLeft(){
        if ($this.CurrentFuel -le 0 -or $this.FuelConsumption -le 0) {
            return "Wrond data"
        } else {
            return [math]::Round($this.CurrentFuel / $this.FuelConsumption * 100, 2);
        }
    }

    [String]HoursLeft([int]$KmPerHour){
        $kmToSec =[timespan]::FromSeconds([math]::Round($this.CurrentFuel / $this.FuelConsumption * 100, 2)/$KmPerHour * 60 * 60)
        return $kmToSec.ToString("hh' hours 'mm' minutes'")

    }
}

Class TwoDoorCar : Car {
    # Using parent constructor and setting constant parameter for $DoorsAmount. This value has to be 2
    TwoDoorCar(
        [String] $Brand,
        [String] $Model,
        [double] $FuelConsumption,
        [double] $CurrentFuel
    ) : base($Brand, $Model, 2, $FuelConsumption, $CurrentFuel){
    }
}

#Creating class instance
[Car]$newCar = [TwoDoorCar]::new("Audi", "RS5", 10.2, 50.5)

#Convert object to Json
$toJson = $newCar | ConvertTo-Json
$toJson
#Convert json to object
$fromJson =$toJson | ConvertFrom-Json
$fromJson

#Sending Json to localhost
#It's necessary to specify URL using exactly your path
#Since I used XAMPP control panel and you can use other
Invoke-WebRequest -Body $toJson -Method Post