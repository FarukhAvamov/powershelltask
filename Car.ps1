Class Car {
    [String] $Brand
    [String] $Model
    [int] $DoorsAmount
    [double] $FuelConsumption
    [double] $CurrentFuel

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
    TwoDoorCar(
        [String] $Brand,
        [String] $Model,
        [double] $FuelConsumption,
        [double] $CurrentFuel
    ) : base($Brand, $Model, 2, $FuelConsumption, $CurrentFuel){
    }
}


[Car]$newCar = [TwoDoorCar]::new("Audi", "RS5", 10.2, 50.5)

$json = ConvertTo-Json($newCar);
Invoke-WebRequest 127.0.0.1 -Body $json -Method Post -UseBasicParsing




