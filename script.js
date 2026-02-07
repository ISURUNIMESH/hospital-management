function bookAppointment() {

  const patient = document.getElementById("aptName").value;
  const phone = document.getElementById("aptPhone").value;
  const doctor = document.getElementById("aptDoctor").value;
  const date = document.getElementById("aptDate").value;
  const problem = document.getElementById("aptProblem").value;

  if (!patient || !phone || !doctor || !date) {
    alert("Please fill all required fields");
    return;
  }

  fetch("backend/save_appointment.php", {
    method: "POST",
    body: JSON.stringify({
      patient: patient,
      phone: phone,
      doctor: doctor,
      date: date,
      problem: problem
    }),
    headers: {
      "Content-Type": "application/json"
    }
  })
  .then(res => res.json())
  .then(data => {
    if (data.status === "success") {
      alert("Appointment booked successfully!");
      document.querySelector(".patient-form").reset();
      loadAppointments();
    } else {
      alert("Error booking appointment: " + data.message);
    }
  })
  .catch(err => {
    alert("Server error: " + err);
  });
}

function loadAppointments() {
  fetch("backend/get_appointments.php")
    .then(res => res.json())
    .then(data => {

      let table = document.getElementById("appointmentTable");
      table.innerHTML = "";

      data.forEach(row => {
        table.innerHTML += `
          <tr>
            <td>${row.id}</td>
            <td>${row.patient_name}</td>
            <td>${row.doctor}</td>
            <td>${row.appointment_date}</td>
            <td>${row.status}</td>
          </tr>
        `;
      });

    });
}
