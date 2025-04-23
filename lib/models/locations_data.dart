import 'package:flutter/material.dart';

class LocationData {
  final String? province;
  final String? district;
  final String? cell;
  final String? village;

  LocationData({
    this.province,
    this.district,
    this.cell,
    this.village,
  });

  Map<String, dynamic> toJson() {
    return {
      'province': province,
      'district': district,
      'cell': cell,
      'village': village,
    };
  }

  @override
  String toString() {
    return 'LocationData(province: $province, district: $district, cell: $cell, village: $village)';
  }
}

class LocationSelector extends StatefulWidget {
  final Function(LocationData) onLocationSelected;

  const LocationSelector({
    super.key,
    required this.onLocationSelected,
  });

  @override
  State<LocationSelector> createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  String? selectedProvince;
  String? selectedDistrict;
  String? selectedCell;
  String? selectedVillage;

  // Location data structure
  final Map<String, Map<String, Map<String, List<String>>>> locationData = {
    'North': {
      'Musanze': {
        'Busogo': ['Kavumu', 'Sahara', 'Nyagisozi'],
        'Cyuve': ['Bukinanyana', 'Kibeza', 'Migeshi']
      },
      'Burera': {
        'Butaro': ['Gatsibo', 'Nyamicucu', 'Rusumo'],
        'Kinoni': ['Rusoro', 'Kagogo', 'Rweru']
      }
    },
    'South': {
      'Huye': {
        'Ngoma': ['Butare', 'Kabuye', 'Matyazo'],
        'Tumba': ['Cyarwa', 'Cyimana', 'Gitwa']
      },
      'Nyanza': {
        'Busasamana': ['Kavumu', 'Kibinja', 'Rwesero'],
        'Mukingo': ['Cyeru', 'Gahondo', 'Mukora']
      }
    }
  };

  // Get available options based on selections
  List<String> getDistricts() {
    return selectedProvince != null
        ? locationData[selectedProvince]!.keys.toList()
        : [];
  }

  List<String> getCells() {
    return (selectedProvince != null && selectedDistrict != null)
        ? locationData[selectedProvince]![selectedDistrict]!.keys.toList()
        : [];
  }

  List<String> getVillages() {
    return (selectedProvince != null &&
            selectedDistrict != null &&
            selectedCell != null)
        ? locationData[selectedProvince]![selectedDistrict]![selectedCell]!
        : [];
  }

  // Update location data and notify parent
  void _updateLocationData() {
    final locationData = LocationData(
      province: selectedProvince,
      district: selectedDistrict,
      cell: selectedCell,
      village: selectedVillage,
    );
    widget.onLocationSelected(locationData);
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String hint,
    required Function(String?) onChanged,
    required bool enabled,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          prefixIcon: const Icon(
            Icons.location_on_outlined,
            color: Colors.blue,
          ),
        ),
        hint: Text(hint),
        items: items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: enabled ? onChanged : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Province Dropdown
        _buildDropdown(
          value: selectedProvince,
          items: locationData.keys.toList(),
          hint: 'Select Province',
          enabled: true,
          onChanged: (province) {
            setState(() {
              selectedProvince = province;
              selectedDistrict = null;
              selectedCell = null;
              selectedVillage = null;
            });
            _updateLocationData();
          },
        ),

        // District Dropdown
        _buildDropdown(
          value: selectedDistrict,
          items: getDistricts(),
          hint: 'Select District',
          enabled: selectedProvince != null,
          onChanged: (district) {
            setState(() {
              selectedDistrict = district;
              selectedCell = null;
              selectedVillage = null;
            });
            _updateLocationData();
          },
        ),

        // Cell Dropdown
        _buildDropdown(
          value: selectedCell,
          items: getCells(),
          hint: 'Select Cell',
          enabled: selectedDistrict != null,
          onChanged: (cell) {
            setState(() {
              selectedCell = cell;
              selectedVillage = null;
            });
            _updateLocationData();
          },
        ),

        // Village Dropdown
        _buildDropdown(
          value: selectedVillage,
          items: getVillages(),
          hint: 'Select Village',
          enabled: selectedCell != null,
          onChanged: (village) {
            setState(() {
              selectedVillage = village;
            });
            _updateLocationData();
          },
        ),
      ],
    );
  }
}
