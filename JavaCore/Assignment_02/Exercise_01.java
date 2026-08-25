//Exercise_01: flow control
//If
        // Question 1
        System.out.println("\n--- Question 1 ---");
        if (acc2.department == null) {
            System.out.println("Nhân viên này chưa có phòng ban");
        } else {
            System.out.println("Phòng ban của nhân viên này là " + acc2.department.name);
        }

        // Question 2
        System.out.println("\n--- Question 2 ---");
        if (acc2.groups == null || acc2.groups.length == 0) {
            System.out.println("Nhân viên này chưa có group");
        } else {
            int groupCount = acc2.groups.length;
            if (groupCount == 1 || groupCount == 2) {
                System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
            } else if (groupCount == 3) {
                System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
            } else {
                System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
            }
        }

        // Question 3
        System.out.println("\n--- Question 3 ---");
        String q3Result = (acc2.department == null)
                ? "Nhân viên này chưa có phòng ban"
                : "Phòng ban của nhân viên này là " + acc2.department.name;
        System.out.println(q3Result);

        // Question 4
        System.out.println("\n--- Question 4 ---");
        String q4Result = (acc1.position != null && acc1.position.name == PositionName.DEV)
                ? "Đây là Developer"
                : "Người này không phải là Developer";
        System.out.println(q4Result);

        // ================= SWITCH CASE =================
        System.out.println("\n----- SWITCH CASE -----");

        // Question 5
        System.out.println("\n--- Question 5 ---");
        int countAccInGroup1 = (group1.accounts != null) ? group1.accounts.length : 0;
        switch (countAccInGroup1) {
            case 1:
                System.out.println("Nhóm có một thành viên");
                break;
            case 2:
                System.out.println("Nhóm có hai thành viên");
                break;
            case 3:
                System.out.println("Nhóm có ba thành viên");
                break;
            default:
                System.out.println("Nhóm có nhiều thành viên");
                break;
        }

        // Question 6
        System.out.println("\n--- Question 6 ---");
        int countGroupAcc2 = (acc2.groups != null) ? acc2.groups.length : 0;
        switch (countGroupAcc2) {
            case 0:
                System.out.println("Nhân viên này chưa có group");
                break;
            case 1:
            case 2:
                System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
                break;
            case 3:
                System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
                break;
            default:
                System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
                break;
        }

        // Question 7
        System.out.println("\n--- Question 7 ---");
        PositionName posName = (acc1.position != null) ? acc1.position.name : null;
        if (posName != null) {
            switch (posName) {
                case DEV:
                    System.out.println("Đây là Developer");
                    break;
                default:
                    System.out.println("Người này không phải là Developer");
                    break;
            }
        } else {
            System.out.println("Người này không phải là Developer");
        }

        // ================= FOREACH =================
        System.out.println("\n----- FOREACH -----");

        // Question 8
        System.out.println("\n--- Question 8 ---");
        for (Account acc : accounts) {
            String depName = (acc.department != null) ? acc.department.name : "Chưa có";
            System.out.println("Email: " + acc.email + " | FullName: " + acc.fullName + " | Phòng ban: " + depName);
        }

        // Question 9
        System.out.println("\n--- Question 9 ---");
        for (Department dep : departments) {
            System.out.println("Id: " + dep.id + " | Name: " + dep.name);
        }

        // ================= FOR =================
        System.out.println("\n----- FOR -----");

        // Question 10
        System.out.println("\n--- Question 10 ---");
        for (int i = 0; i < accounts.length; i++) {
            System.out.println("Thông tin account thứ " + (i + 1) + " là:");
            System.out.println("Email: " + accounts[i].email);
            System.out.println("Full name: " + accounts[i].fullName);
            System.out.println("Phòng ban: " + ((accounts[i].department != null) ? accounts[i].department.name : "Chưa có"));
        }

        // Question 11
        System.out.println("\n--- Question 11 ---");
        for (int i = 0; i < departments.length; i++) {
            System.out.println("Thông tin department thứ " + (i + 1) + " là:");
            System.out.println("Id: " + departments[i].id);
            System.out.println("Name: " + departments[i].name);
        }

        // Question 12
        System.out.println("\n--- Question 12 ---");
        for (int i = 0; i < 2 && i < departments.length; i++) {
            System.out.println("Thông tin department thứ " + (i + 1) + " là:");
            System.out.println("Id: " + departments[i].id);
            System.out.println("Name: " + departments[i].name);
        }

        // Question 13
        System.out.println("\n--- Question 13 ---");
        for (int i = 0; i < accounts.length; i++) {
            if (i == 1) { // Account thứ 2 có index là 1
                continue;
            }
            System.out.println("Thông tin account thứ " + (i + 1) + " là:");
            System.out.println("Email: " + accounts[i].email);
            System.out.println("Full name: " + accounts[i].fullName);
            System.out.println("Phòng ban: " + ((accounts[i].department != null) ? accounts[i].department.name : "Chưa có"));
        }

        // Question 14
        System.out.println("\n--- Question 14 ---");
        for (int i = 0; i < accounts.length; i++) {
            if (accounts[i].id >= 4) {
                continue;
            }
            System.out.println("Id: " + accounts[i].id + " | Full name: " + accounts[i].fullName + " | Email: " + accounts[i].email);
        }

        // Question 15
        System.out.println("\n--- Question 15 ---");
        for (int i = 1; i <= 20; i++) {
            if (i % 2 == 0) {
                System.out.print(i + " ");
            }
        }
        System.out.println();

        // ================= WHILE =================
        System.out.println("\n----- WHILE -----");

        // Question 16 - Làm lại Q10 bằng While
        System.out.println("\n--- Question 16 (Q10 via While) ---");
        int idx10 = 0;
        while (idx10 < accounts.length) {
            System.out.println("Thông tin account thứ " + (idx10 + 1) + " là:");
            System.out.println("Email: " + accounts[idx10].email);
            System.out.println("Full name: " + accounts[idx10].fullName);
            System.out.println("Phòng ban: " + ((accounts[idx10].department != null) ? accounts[idx10].department.name : "Chưa có"));
            idx10++;
        }

        // Question 16 - Làm lại Q11 bằng While
        System.out.println("\n--- Question 16 (Q11 via While) ---");
        int idx11 = 0;
        while (idx11 < departments.length) {
            System.out.println("Thông tin department thứ " + (idx11 + 1) + " là:");
            System.out.println("Id: " + departments[idx11].id);
            System.out.println("Name: " + departments[idx11].name);
            idx11++;
        }

        // Question 16 - Làm lại Q12 bằng While + break
        System.out.println("\n--- Question 16 (Q12 via While + break) ---");
        int idx12 = 0;
        while (idx12 < departments.length) {
            if (idx12 >= 2) {
                break;
            }
            System.out.println("Thông tin department thứ " + (idx12 + 1) + " là:");
            System.out.println("Id: " + departments[idx12].id);
            System.out.println("Name: " + departments[idx12].name);
            idx12++;
        }

        // Question 16 - Làm lại Q13 bằng While + continue
        System.out.println("\n--- Question 16 (Q13 via While + continue) ---");
        int idx13 = 0;
        while (idx13 < accounts.length) {
            if (idx13 == 1) {
                idx13++;
                continue;
            }
            System.out.println("Thông tin account thứ " + (idx13 + 1) + " là:");
            System.out.println("Email: " + accounts[idx13].email);
            System.out.println("Full name: " + accounts[idx13].fullName);
            System.out.println("Phòng ban: " + ((accounts[idx13].department != null) ? accounts[idx13].department.name : "Chưa có"));
            idx13++;
        }

        // Question 16 - Làm lại Q14 bằng While + continue
        System.out.println("\n--- Question 16 (Q14 via While + continue) ---");
        int idx14 = 0;
        while (idx14 < accounts.length) {
            if (accounts[idx14].id >= 4) {
                idx14++;
                continue;
            }
            System.out.println("Id: " + accounts[idx14].id + " | Full name: " + accounts[idx14].fullName);
            idx14++;
        }

        // Question 16 - Làm lại Q15 bằng While
        System.out.println("\n--- Question 16 (Q15 via While) ---");
        int num15 = 1;
        while (num15 <= 20) {
            if (num15 % 2 == 0) {
                System.out.print(num15 + " ");
            }
            num15++;
        }
        System.out.println();

        // ================= DO-WHILE =================
        System.out.println("\n----- DO-WHILE -----");

        // Question 17 - Làm lại Q10 bằng Do-While
        System.out.println("\n--- Question 17 (Q10 via Do-While) ---");
        int dIdx10 = 0;
        if (accounts.length > 0) {
            do {
                System.out.println("Thông tin account thứ " + (dIdx10 + 1) + " là:");
                System.out.println("Email: " + accounts[dIdx10].email);
                System.out.println("Full name: " + accounts[dIdx10].fullName);
                System.out.println("Phòng ban: " + ((accounts[dIdx10].department != null) ? accounts[dIdx10].department.name : "Chưa có"));
                dIdx10++;
            } while (dIdx10 < accounts.length);
        }

        // Question 17 - Làm lại Q11 bằng Do-While
        System.out.println("\n--- Question 17 (Q11 via Do-While) ---");
        int dIdx11 = 0;
        if (departments.length > 0) {
            do {
                System.out.println("Thông tin department thứ " + (dIdx11 + 1) + " là:");
                System.out.println("Id: " + departments[dIdx11].id);
                System.out.println("Name: " + departments[dIdx11].name);
                dIdx11++;
            } while (dIdx11 < departments.length);
        }

        // Question 17 - Làm lại Q12 bằng Do-While + break
        System.out.println("\n--- Question 17 (Q12 via Do-While + break) ---");
        int dIdx12 = 0;
        if (departments.length > 0) {
            do {
                if (dIdx12 >= 2) {
                    break;
                }
                System.out.println("Thông tin department thứ " + (dIdx12 + 1) + " là:");
                System.out.println("Id: " + departments[dIdx12].id);
                System.out.println("Name: " + departments[dIdx12].name);
                dIdx12++;
            } while (dIdx12 < departments.length);
        }

        // Question 17 - Làm lại Q13 bằng Do-While + continue
        System.out.println("\n--- Question 17 (Q13 via Do-While + continue) ---");
        int dIdx13 = 0;
        if (accounts.length > 0) {
            do {
                if (dIdx13 == 1) {
                    dIdx13++;
                    continue;
                }
                System.out.println("Thông tin account thứ " + (dIdx13 + 1) + " là:");
                System.out.println("Email: " + accounts[dIdx13].email);
                System.out.println("Full name: " + accounts[dIdx13].fullName);
                System.out.println("Phòng ban: " + ((accounts[dIdx13].department != null) ? accounts[dIdx13].department.name : "Chưa có"));
                dIdx13++;
            } while (dIdx13 < accounts.length);
        }

        // Question 17 - Làm lại Q14 bằng Do-While + continue
        System.out.println("\n--- Question 17 (Q14 via Do-While + continue) ---");
        int dIdx14 = 0;
        if (accounts.length > 0) {
            do {
                if (accounts[dIdx14].id >= 4) {
                    dIdx14++;
                    continue;
                }
                System.out.println("Id: " + accounts[dIdx14].id + " | Full name: " + accounts[dIdx14].fullName);
                dIdx14++;
            } while (dIdx14 < accounts.length);
        }

        // Question 17 - Làm lại Q15 bằng Do-While
        System.out.println("\n--- Question 17 (Q15 via Do-While) ---");
        int dNum15 = 1;
        do {
            if (dNum15 % 2 == 0) {
                System.out.print(dNum15 + " ");
            }
            dNum15++;
        } while (dNum15 <= 20);
        System.out.println();
    }
}