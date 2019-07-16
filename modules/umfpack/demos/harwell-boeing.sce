// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright Bruno Pinçon, ESIAL-IECN, Inria CORIDA project
//   <bruno.pincon@iecn.u-nancy.fr>
//
// This file is released under the 3-clause BSD license. See COPYING-BSD.

function demos_harwell_boeing()

    format(15);
    cd "SCI/modules/umfpack/demos/"

    disp(_("This test compares umfpack v3 and sparse v1.3 via their Scilab interface."));
    disp(_("The test consists in loading Harwell-Boeing sparse matrices and solve linear system with a random rhs."));
    disp(_("The matrices presented here come from the NIST server Matrix server:"));
    printf("     http://math.nist.gov/MatrixMarket/matrices.html\n");
    disp(_("Warning: tests 2 and 3 take much more time than the others."));
    halt(_("\nPress Return to continue...\n"));


    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // Test 1: Jacobian of a nonlinear system of ordinary differential equations (ODEs) modeling a laser
    clear
    nb_rep = 10;
    A = ReadHBSparse("arc130.rua");
    b = rand(130, 500);
    t1 = 0;
    for i = 1:nb_rep
        tic(); x = umfpack(A,"\",b); t1 = t1 + toc();
    end
    t1 = t1 / nb_rep;
    norm1 = norm(A*x-b);

    t2 = 0;
    for i = 1:nb_rep
        tic(); x = A\b; t2 = t2 + toc();
    end
    t2 = t2 / nb_rep;
    norm2 = norm(A*x-b);

    disp("------------------------");
    disp(_("Test 1: Jacobian of a nonlinear system of ordinary differential equations (ODEs) modeling a laser"));
    disp(_("  Mean time and accuracy for umfpack (t1 and ||A*x-b||):"));
    disp([t1 norm1]);
    disp(_("  Time and accuracy for sparse module (t2 and ||A*x-b||):"));
    disp([t2 norm2]);
    disp(_("  Time comparison (t2/t1):"));
    disp(t2/t1);
    halt(_("\nPress Return to continue...\n"));


    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // Test 2: Generalized eigenvalue problem Kx = (lambda)Mx
    clear
    nb_rep = 5;
    B = ReadHBSparse("bcsstk24.rsa");
    b = rand(3562, 1);
    t1 = 0;
    for i = 1:nb_rep
        tic(); x = umfpack(B,"\",b); t1 = t1 + toc();
    end
    t1 = t1 / nb_rep;
    norm1 = norm(B*x-b);

    t2 = 0;
    for i = 1:nb_rep
        tic(); x = B\b; t2 = t2 + toc();
    end
    t2 = t2 / nb_rep;
    norm2 = norm(B*x-b);

    disp("------------------------");
    disp(_("Test 2: Generalized eigenvalue problem Kx = (lambda)Mx"));
    disp(_("  Mean time and accuracy for umfpack (t1 and ||A*x-b||):"));
    disp([t1 norm1]);
    disp(_("  Time and accuracy for sparse module (t2 and ||A*x-b||):"));
    disp([t2 norm2]);
    disp(_("  Time comparison (t2/t1):"));
    disp(t2/t1);
    halt(_("\nPress Return to continue...\n"));


    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // Test 3: Matrices generated by the FIDAP Package
    clear
    nb_rep = 2;
    C = ReadHBSparse("ex14.rua");
    b = rand(3251, 1);
    t1 = 0;
    for i = 1:nb_rep
        tic(); x = umfpack(C,"\",b); t1 = t1 + toc();
    end
    t1 = t1 / nb_rep;
    norm1 = norm(C*x-b);

    t2 = 0;
    for i = 1:nb_rep
        tic(); x = C\b; t2 = t2 + toc();
    end
    t2 = t2 / nb_rep;
    norm2 = norm(C*x-b);

    disp("------------------------");
    disp(_("Test 3: Matrices generated by the FIDAP Package"));
    disp(_("  Mean time and accuracy for umfpack (t1 and ||A*x-b||):"));
    disp([t1 norm1]);
    disp(_("  Time and accuracy for sparse module (t2 and ||A*x-b||):"));
    disp([t2 norm2]);
    disp(_("  Time comparison (t2/t1):"));
    disp(t2/t1);
    halt(_("\nPress Return to continue...\n"));


    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // Test 4: Tokamak Matrices
    clear
    nb_rep = 1;
    warning("off");
    D = ReadHBSparse("utm300.rua");
    b = rand(300, 1);
    t1 = 0;
    for i = 1:nb_rep
        tic(); x = umfpack(D,"\",b); t1 = t1 + toc();
    end
    t1 = t1 / nb_rep;
    norm1 = norm(D*x-b);

    t2 = 0;
    for i = 1:nb_rep
        tic(); x = D\b; t2 = t2 + toc();
    end
    t2 = t2 / nb_rep;
    norm2 = norm(D*x-b);

    disp("------------------------");
    disp(_("Test 4: Tokamak Matrices"));
    disp(_("  Mean time and accuracy for umfpack (t1 and ||A*x-b||):"));
    disp([t1 norm1]);
    disp(_("  Time and accuracy for sparse module (t2 and ||A*x-b||):"));
    disp([t2 norm2]);
    disp(_("  Time comparison (t2/t1):"));
    disp(t2/t1);
    halt(_("\nPress Return to continue...\n"));


    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // Test 5: Acoustic scattering
    clear
    nb_rep = 10;
    E = ReadHBSparse("young1c.csa");
    b = rand(841, 1);
    t1 = 0;
    for i = 1:nb_rep
        tic(); x = umfpack(E,"\",b); t1 = t1 + toc();
    end
    t1 = t1 / nb_rep;
    norm1 = norm(E*x-b);

    t2 = 0;
    for i = 1:nb_rep
        tic(); x = E\b; t2 = t2 + toc();
    end
    t2 = t2 / nb_rep;
    norm2 = norm(E*x-b);

    disp("------------------------");
    disp(_("Test 5: Acoustic scattering"));
    disp(_("  Mean time and accuracy for umfpack (t1 and ||A*x-b||):"));
    disp([t1 norm1]);
    disp(_("  Time and accuracy for sparse module (t2 and ||A*x-b||):"));
    disp([t2 norm2]);
    disp(_("  Time comparison (t2/t1):"));
    disp(t2/t1);
    disp("------------------------");

endfunction

demos_harwell_boeing()
clear demos_harwell_boeing;